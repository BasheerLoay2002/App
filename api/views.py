"""
API views for the three endpoints.
"""
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status


@api_view(['GET'])
def endpoint_a(request):
    """
    Endpoint A - Returns a simple message.
    """
    return Response("Hello from endpoint a!", status=status.HTTP_200_OK)


@api_view(['GET'])
def endpoint_b(request):
    """
    Endpoint B - Returns a simple message.
    """
    return Response("Hello from endpoint b!", status=status.HTTP_200_OK)


@api_view(['GET'])
def endpoint_c(request):
    """
    Endpoint C - Returns a simple message.
    """
    return Response("Hello from endpoint c!", status=status.HTTP_200_OK)
