import flet as ft

def main(page: ft.Page):
    page.add(ft.Text(value='!'))

ft.app(target=main, view=ft.WEB_BROWSER)

